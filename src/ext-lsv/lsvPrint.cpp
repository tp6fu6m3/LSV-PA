#include "lsv.hpp"

void Lsv_NtkPrintNodes(Abc_Ntk_t* pNtk) {
  Abc_Obj_t* pObj;
  int i;
  Abc_NtkForEachNode(pNtk, pObj, i) {
    printf("Object Id = %d, name = %s\n", Abc_ObjId(pObj), Abc_ObjName(pObj));
    Abc_Obj_t* pFanin;
    int j;
    Abc_ObjForEachFanin(pObj, pFanin, j) {
      printf("  Fanin-%d: Id = %d, name = %s\n", j, Abc_ObjId(pFanin),
             Abc_ObjName(pFanin));
    }
    if (Abc_NtkHasSop(pNtk)) {
      printf("The SOP of this node:\n%s", (char*)pObj->pData);
    }
  }
}

void Lsv_NtkPrintSopunate(Abc_Ntk_t* pNtk) {
  Abc_Obj_t* pObj;
  int i;
  Abc_NtkForEachNode(pNtk, pObj, i) {
    printf("node %s:\n", Abc_ObjName(pObj));
    int j;
    int nVariable = Abc_ObjFaninNum(pObj);
    vector<bool> pPhase(nVariable,0);
    vector<bool> nPhase(nVariable,0);
    string pUnate = "", nUnate = "", binate = "";
    const char* delimiterChar0 = " ", *delimiterChar1 = "\n";
    char *line, *phase;
    if (Abc_NtkHasSop(pNtk)) {
        cout << (char*)pObj->pData;
        line = strtok((char*)pObj->pData, delimiterChar0);
        phase = strtok(NULL, delimiterChar1);
        while(line){
            for(j = 0; j < nVariable; ++j){
                char type = *(line+j);
                if((type == '1' && *phase) || (type == '0' && !*phase)){
                    pPhase[j] = 1;
                }
                else if((type == '0' && *phase) || (type == '1' && !*phase)){
                    nPhase[j] = 1;
                }
            }
            line = strtok(NULL, delimiterChar0);
            phase = strtok(NULL, delimiterChar1);
        }
    }
    for(j = 0; j < nVariable; ++j){
        Abc_Obj_t* pFanin;
        pFanin = Abc_ObjFanin(pObj, j);
        if(pPhase[j]&&nPhase[j]){
            binate = binate + " " + Abc_ObjName(pFanin);
        }
        else if(pPhase[j]){
            pUnate = pUnate + " " + Abc_ObjName(pFanin);
        }
        else if(nUnate[j]){
            nUnate = nUnate + " " + Abc_ObjName(pFanin);
        }
    }
    if(pUnate.size()) printf("+unate inputs:%s\n", pUnate.c_str());
    if(nUnate.size()) printf("-unate inputs:%s\n", nUnate.c_str());
    if(binate.size()) printf("binate inputs:%s\n", binate.c_str());
  }
}
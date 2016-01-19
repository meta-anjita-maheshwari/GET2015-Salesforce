public class ClassStudent {
    
   public static List<Student__c> getStudents(String classId){
       List<Student__c> studentList = [Select FirstName__c, Last_Name__c From Student__c Where Class__r.Id = :classId ];
       return studentList;
   }
   
    public static Map<Class__c,Set<ID>> getMapOfClass(){
        List<Class__c> classList=[select c.ID,c.Name from Class__c c];
        Map<Class__c,Set<ID>> map1=new Map<Class__c,Set<ID>>();
        for(Integer i=0; i<classList.size();i++){
         	Set<ID> studentSet= new Map<Id, Student__c>([Select s.ID from Student__c s where s.Class__r.id=:classList.get(i).Id ]).keySet();
        map1.put(classList.get(i),studentSet);
        }
        System.debug(map1);
     	return map1;
    }
    
   public static Integer workingDays(Date date1, Date date2){
     Integer NoOfDays = 0;
     Date tempStartDate = date1;
     for( integer i = 1; tempStartDate != date2; i ++ ) {
       if(tempStartDate.daysBetween(tempStartDate.toStartofWeek()) == 0 ||
                     tempStartDate.daysBetween(tempStartDate.toStartofWeek()) == -6)
       {
           tempStartDate = tempStartDate.adddays(1);
           continue;
       }
       NoOfDays = NoOfDays+1;
       tempStartDate = tempStartDate.adddays(1);
    }
     return NoOfDays ;
    }
}
public with sharing class RecursionCheck {
    private static Boolean toDoUpdated = false;  
    public static Boolean isToDoUpdated(){
        return toDoUpdated; 
    }
    public static void setToDoUpdated(Boolean updated){
        toDoUpdated = updated;
    }

    private static Boolean toDoInserted = false;  
    public static Boolean isToDoInserted(){
        return toDoInserted; 
    }
    public static void setToDoInserted(Boolean inserted){
        toDoInserted = inserted;
    }

    private static Boolean toDoDeleted = false;  
    public static Boolean isToDoDeleted(){
        return toDoDeleted; 
    }
    public static void setToDoDeleted(Boolean deleted){
        toDoDeleted = deleted;
    }



    private static Boolean subToDoUpdated = false;  
    public static Boolean isSubToDoUpdated(){
        return subToDoUpdated; 
    }
    public static void setSubToDoUpdated(Boolean updated){
        subToDoUpdated = updated;
    }

    private static Boolean subToDoInserted = false;  
    public static Boolean isSubToDoInserted(){
        return subToDoInserted; 
    }
    public static void setSubToDoInserted(Boolean inserted){
        subToDoInserted = inserted;
    }

    private static Boolean SubToDoDeleted = false;  
    public static Boolean isSubToDoDeleted(){
        return SubToDoDeleted; 
    }
    public static void setSubToDoDeleted(Boolean deleted){
        SubToDoDeleted = deleted;
    }
}
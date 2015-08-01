public class outerClass{

    public outerClass()
        {
            listWrapper = new list<innerWrapperClass>();
            listWrapper.add(new innerWrapperClass(new Account() , 'Name'));
            listWrapper.add(new innerWrapperClass(new Account() , 'Owner'));
        }
    
    Public list<innerWrapperClass> listWrapper {get;set;}
    
    public class innerWrapperClass{
         public SObject sObj {get;set;}
         public String field{get;set;}
        public innerWrapperClass(SObject sObj , String  field)
            {
                this.sObj = sObj;
                this.field = field;
            
            }
    }
}
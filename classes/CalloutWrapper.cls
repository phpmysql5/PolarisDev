public class CalloutWrapper{
    public class CandidateWrapper {
        public String Name{get;set;}
        public String Country{get;set;}
    }
    
    public class CustomerWrapper {
        public String Name{get;set;}
        public String City{get;set;}
        public String Country{get;set;}
    }
    public class StudentWrapper {
        public String Name{get;set;}
        public String AccNumber{get;set;}
        public String Source{get;set;}
        public String Site{get;set;}
        public String Email{get;set;}
    }
    public class ResponseWrapper {
        public List<CandidateWrapper> candidateWrapperList{get;set;}
        public List<CustomerWrapper> customerWrapperList{get;set;}
        public List<StudentWrapper> studentWrapperList{get;set;}
    }
    
}
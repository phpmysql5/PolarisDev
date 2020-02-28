public class button {
public PageReference redirect()
{
   PageReference pr = new PageReference('/apex/yourVFPageName');
   return pr;
}
}
global class PendingEmailBatchScheduler  implements Schedulable  {
  global void execute(Schedulablecontext sc)
          {
             PendingEmailBatch invoke=new PendingEmailBatch();
         
             Database.executeBatch(invoke,5);
          }


}
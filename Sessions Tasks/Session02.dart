import 'dart:io';

void main()
{
  bankAccountSystem();
  print("\n\n\n");
  librarySystem();
  print("\n\n\n");
  taskManagementSystem();
}

void bankAccountSystem()
{
  BankAccount acc1= new BankAccount("10", "Maryam", 2000);
  acc1.deposit(100);
  print("Your Balance is: ${acc1.getBalance()}");
  acc1.withdraw(100);
  print("Your Balance is: ${acc1.getBalance()}");
  acc1.withdraw(2500);

  SavingsAccount acc2=new SavingsAccount("10", "Maryam", 2000, 10);
  print("Your Balance after adding interests is: ${acc2.calculateInterest()}"); //Yarab akon fhmto s7
}

void librarySystem()
{
  Book bk1=new Book("Game of Thrones", "someName");
  Book bk2=new Book("Harry Potter", "someName");
  Book bk3=new Book("The Art of Flutter", "someName");

  Patron pat1=new Patron("Maryam");
  pat1.borrowBook(bk2);
  pat1.borrowBook(bk3);
  for (int i=0 ; i< pat1.booksBorrowed.length;i++) stdout.write(pat1.booksBorrowed[i].title+" | ");
  pat1.returnBook(bk3);
  pat1.returnBook(bk3);
  for (int i=0 ; i< pat1.booksBorrowed.length;i++) stdout.write(pat1.booksBorrowed[i].title+" | ");
  pat1.borrowBook(bk2);
  pat1.borrowBook(bk1);
  for (int i=0 ; i< pat1.booksBorrowed.length;i++) stdout.write(pat1.booksBorrowed[i].title+" | ");
}

void taskManagementSystem()
{
  Task tsk1=new Task("Flutter", "Finish Tasks due to Tuesday");
  Task tsk2=new Task("Sleep", "Need to sleep");
  Task tsk3=new Task("Eat", "Eat anything");

  TaskList myTasks=new TaskList("My Tasks");
  myTasks.printTasks();
  myTasks.addTask(tsk1);
  myTasks.addTask(tsk2);
  myTasks.addTask(tsk3);

  myTasks.completeTask("Flutter");
  print(tsk1.toString()+"\n");

  myTasks.printTasks();
}

class BankAccount
{
  String accountNumber,accountHolder;
  double balance;
  BankAccount(this.accountNumber,this.accountHolder,this.balance);
  void deposit(double x){balance+=x;}
  void withdraw(double x)
  {
    if(balance>=x)balance-=x;
    else print("Balance insufficient");
  }
  double getBalance()=>balance;
}


class SavingsAccount extends BankAccount
{
  double interestRate;
  SavingsAccount(super.accountNumber, super.accountHolder,super.balance,this.interestRate);
  void withdraw(double x)
  {
    if(balance>=x)balance-=x;
    else print("Balance insufficient");
  }
  double calculateInterest()
  {
    double interest=(interestRate*balance)/100;
    return balance+interest;
  }
}


class Book
{
  String title,author;
  late bool isAvailable;
  Book(this.title,this.author){isAvailable=true;}
  void borrowBook()
  {
    if (isAvailable)
      isAvailable=false;
    else print("\n${title} book is unavailable");
  }
  void returnBook(){isAvailable=true;}
}

class Patron
{
  String name;
  late List<Book> booksBorrowed;
  Patron(this.name) {booksBorrowed=[];}
  void borrowBook(Book theBook)
  {
    if (theBook.isAvailable) booksBorrowed.add(theBook);
    theBook.borrowBook();
  }
  void returnBook(Book theBook)
  {
    if(booksBorrowed.contains(theBook))
      {
        booksBorrowed.remove(theBook);
        theBook.returnBook();
      }
    else print("\n${theBook.title} book hasn't been borrowed");
  }
}

class Task
{
  String title,description;
  late bool isCompleted;
  Task(this.title,this.description){isCompleted=false;}
  void completeTask(){isCompleted=true;}
  String toString()=> "Task: $title\nDescription: $description\nCompleted: $isCompleted";
}

class TaskList
{
  String name;
  late List<Task> tasks;
  TaskList(this.name){tasks=[];}
  void addTask(Task theTask){tasks.add(theTask);}
  void completeTask(String title)
  {
    for (int i=0;i<tasks.length;i++)
      if(tasks[i].title==title) tasks[i].completeTask();
  }
  void printTasks()
  {
    if(!tasks.isEmpty) print("Your tasks are: ");
    else print("You have no tasks.");
    for (int i=0;i<tasks.length;i++)
      stdout.write(tasks[i].title+" | ");
    print("");
  }
}
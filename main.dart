class BusCard {
  String _owner = '';
  int _balance = 0;

  // Constructor
  BusCard(String owner, int balance) {
    _owner = owner;
    _balance = balance;
  }

  // Getter for owner
  String get owner {
    return _owner;
  }

  // TODO 1: getter for balance
  int get balance {
    return _balance;
  }

  // Setter for owner, with a rule
  set owner(String newName) {
    if (newName.length < 3) {
      print('Error: name too short');
    } else {
      _owner = newName;
    }
  }

  void showInfo() {
    print('Owner: $_owner | Balance: $_balance RWF');
  }

  // TODO 2: topUp
  void topUp(int amount) {
    if (amount >= 500 && amount <= 50000) {
      _balance = _balance + amount;
      print('Topped up $amount RWF');
    } else {
      print('Error: top-up must be 500 to 50000 RWF');
    }
  }

  // TODO 3: pay
  void pay(int fare) {
    if (fare > _balance) {
      print('Card declined');
    } else {
      _balance = _balance - fare;
      print('Paid $fare RWF');
    }
  }
}

class StudentCard extends BusCard {
  int _discount = 0;

  // ": super(owner, balance)" builds the parent BusCard first
  StudentCard(String owner, int balance, int discount) : super(owner, balance) {
    _discount = discount;
  }

  @override
  void showInfo() {
    super.showInfo(); // run the parent's showInfo first
    print('Student card: $_discount% off');
  }

  // TODO 4: override pay
  @override
  void pay(int fare) {
    int off = fare * _discount ~/ 100;
    print('Student discount: $off RWF');
    super.pay(fare - off);
  }
}

void main() {
  // My numbers: D = 50, L = 0
  // Starting balance = 1500 RWF, Bus fare = 250 RWF, Discount = 10%

  BusCard card = BusCard('Mark', 1500);
  card.owner = 'Al'; // refused: name too short
  card.showInfo();

  // TODO 5
  card.owner = 'Mark Daniel Kollie';
  card.showInfo();

  // TODO 6
  card.topUp(100); // refused
  card.topUp(2000); // accepted

  // TODO 7
  card.pay(250);
  card.pay(250);
  card.showInfo();

  // TODO 8
  StudentCard student = StudentCard('Mark Daniel Kollie', 1500, 10);

  // TODO 9
  student.pay(250);
  student.showInfo();
}

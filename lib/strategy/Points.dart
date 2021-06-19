class Points {
  int _health;
  int _treatCount;
  Points(this._health, this._treatCount);

  int get currentHealth {
    if (_health <= 0) {
      return _health = 0;
    } else if (_health >= 20) {
      return _health = 20;
    } else {
      return _health;
    }
  }


  int get currentTreatCount {
    if (_treatCount <= 0) {
      return _treatCount = 0;
    } else {
      return _treatCount;
    }
  }

    set currentHealth(int newHealth) {
 _health = newHealth;
  }
  set currentTreatCount(int newTreatCount) {
 _treatCount = newTreatCount;
  }

}

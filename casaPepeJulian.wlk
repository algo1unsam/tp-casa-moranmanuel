object house {
    var provisions = 50
    var amount = 0

    method enoughProvisions() {
        return provisions > 40
    }

    method needsRepairing() {
        return amount > 0
    }

    method isClean() {
        return self.enoughProvisions() and not self.needsRepairing()
    }

    method updateAmount(newAmount) {
      amount = newAmount
    }
}

object cuentaCorriente {
    var balance = 0

    method deposit(value) {
        balance += value
    }

    method extract(value) {
        balance -= value
    }

    method showBalance() {
        return balance
    }
}

object cuentaConGastos {
    var balance = 0
    var operationCost = 20

    method deposit(value) {
        balance += value - operationCost
    }

    method extract(value) {
        balance -= value
    }

    method showBalance() {
        return balance
    }
}

object cuentaCombinada {
    var primary = cuentaCorriente
    var secondary = cuentaConGastos

    method depositCombinada(value) {
      primary.deposit(value)
    }

    method extract(value) {
      if (primary.showBalance() >= value) {
        primary.extract(value)
      } else secondary.extract(value)
    }

    method showBalance() {
        return primary.showBalance() + secondary.showBalance()
    } 
}
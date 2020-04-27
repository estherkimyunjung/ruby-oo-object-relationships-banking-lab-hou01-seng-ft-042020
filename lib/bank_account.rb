require 'pry'
class BankAccount

    attr_reader :name
    attr_accessor :balance, :status
    @@all = []


    def initialize(name, balance = 1000, status = 'open')
        @name = name
        @balance = balance
        @status = status
        @@all << self
    end

    def self.all
        @@all
    end

    def deposit(amount)
        self.balance += amount
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        (self.balance > 0 && self.status == "open") ? true : false
    end

    def close_account
            self.status = "closed"
    end

end

# a1 = BankAccount.new(n1)

# binding.pry
# 0

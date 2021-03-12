#This is a mortgage calculator
#Given the loan amount, the annual percentage rate, and the loan duration
#The program calculates the monthly mortgage payment

# Create methods to give prompt =>
def prompt(message)
  puts "=>#{message}"
end

#Create validation methods for inputs

# Get inputs
prompt('Enter the total loan amount')
total_loan_amount=gets.chomp().to_f()

prompt('Enter the annual percentage rate (APR), in percentage, e.g. 5 for 5%')
apr_yearly=gets.chomp().to_f()

prompt('Enter the loan duration in years')
loan_duration_years=gets.chomp().to_f()


# Convert inputs
apr_monthly=((apr_yearly/100)/12)
#puts apr_monthly

loan_duration_month=loan_duration_years*12
#puts loan_duration_month

# Main calculations
# Formula to calculate monthly payment: m = p * (j / (1 - (1 + j)**(-n)))

# Define more variables

#def monthly_payment()
  month_payment_amount=total_loan_amount*(apr_monthly/(1-(1+apr_monthly)**(-loan_duration_month)))
  puts month_payment_amount
#end




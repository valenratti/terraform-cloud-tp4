
resource "aws_cognito_user_pool" "cognito_pool" {
    name = var.pool_name

    password_policy {
        minimum_length = 10
        require_lowercase = true
        require_numbers = true
        require_symbols = false
        require_uppercase = true
    }

    
}
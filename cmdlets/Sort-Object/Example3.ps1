
$Cars = @(
    @{
        Name = "Mazda"
        Price = 100000
    },
    @{
        Name = "Toyota"
        Price = 80000
    },
    @{
        Name = "Nissan"
        Price = 90000
    }
)

$Cars | Sort-Object -Property { $_.Price }
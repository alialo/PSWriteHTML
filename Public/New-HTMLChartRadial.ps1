function New-HTMLChartRadial {
    [CmdletBinding()]
    param(
        [nullable[int]] $Height = 350,
        [nullable[int]] $Width,
        [ValidateSet('', 'central')][string] $Positioning,

        [bool] $Horizontal = $true,
        [bool] $DataLabelsEnabled = $true,
        [int] $DataLabelsOffsetX = -6,
        [string] $DataLabelsFontSize = '12px',
        [RGBColors] $DataLabelsColor,
        [Array] $Data = @(),
        [Array] $DataNames = @(),
        [Array] $DataCategories = @(),
        [ValidateSet('datetime', 'category', 'numeric')][string] $DataCategoriesType = 'category',
        [string] $TitleText,
        [ValidateSet('center', 'left', 'right', '')][string] $TitleAlignment = '',

        [bool] $LineShow = $true,
        [ValidateSet('straight', 'smooth')] $LineCurve = 'straight',
        $LineWidth = 2,
        [RGBColors[]] $LineColor,



        [Array] $Names,
        [Array] $Values,
        $Type,
        [ValidateSet('FullCircleTop', 'FullCircleBottom', 'FullCircleBottomLeft', 'FullCircleLeft', 'FullCircleRight', 'Speedometer')] $CircleType = 'FullCircleTop',
        [string] $LabelAverage
    )

    $Options = [ordered] @{}

    New-ChartRadial -Options $Options -Names $Names -Values $Values -Type $Type
    New-ChartRadialCircleType -Options $Options -CircleType $CircleType
    # This added label. It's useful if there's more then one data
    New-HTMLChartRadialDataLabels -Options $Options -Label $LabelAverage
    New-ChartSize -Options $Options -Height $Height -Width $Width
    New-ChartToolbar -Options $Options
    New-ApexChart -Positioning $Positioning -Options $Options
}
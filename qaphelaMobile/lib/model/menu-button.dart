class MenuButton {
    String label;
    int icon;

    MenuButton({this.label, this.icon});
  
    factory MenuButton.fromJson(Map<String, dynamic> json) {
        return MenuButton(
            label: json['label'], 
            icon: json['icon'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['label'] = this.label;
        data['icon'] = this.icon;
        return data;
    }
}
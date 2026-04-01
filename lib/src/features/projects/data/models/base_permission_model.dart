class BasePermissions {
  final bool? show;
  final bool? edit;
  final bool? add;
  final bool? delete;
  final bool? restore;
  final bool? manageMembers;
  final bool? manageSettings;
  final bool? reorder;
  final bool? transferOwnership;
  final bool? archive;
  final bool? unarchive;
  final bool? move;
  final bool? assign;
  final bool? unAssign;
  final bool? changeSprint;
  final bool? setDates;
  final bool? setPriority;
  final bool? addDescription;
  final bool? manageFollowers;
  final bool? setRole;
  final bool? remove;
  final bool? activate;
  final bool? complete;
  final bool? cancel;
  final bool? manageCards;
  final bool? changeRole;

  BasePermissions({
     this.show,
     this.edit,
     this.add,
     this.delete,
     this.restore,
     this.manageMembers,
     this.manageSettings,
     this.reorder,
     this.transferOwnership,
     this.archive,
     this.unarchive,
     this.move,
     this.assign,
     this.unAssign,
     this.changeSprint,
     this.setDates,
     this.setPriority,
     this.addDescription,
     this.manageFollowers,
     this.setRole,
     this.remove,
     this.activate,
     this.complete,
     this.cancel,
     this.manageCards,
     this.changeRole,
  });

  factory BasePermissions.fromJson(Map<String, dynamic>?json){
    if(json==null) return BasePermissions();
    return BasePermissions(show: json['show']??false,
        edit: json['edit']??false,
        add: json['add']??false,
        delete: json['delete']??false,
        restore: json['restore']??false,
        manageMembers: json['manage_members']??false,
        manageSettings: json['manage_settings']??false,
        reorder: json['reorder']??false,
        transferOwnership: json['transfer_ownership']??false,
        archive: json['archive']??false,
        unarchive: json['unarchive']??false,
        move: json['move']??false,
        assign: json['assign']??false,
        unAssign: json['unassign']??false,
        changeSprint: json['change_sprint']??false,
        setDates: json['set_dates']??false,
        setPriority: json['set_priority']??false,
        addDescription: json['add_description']??false,
        manageFollowers: json['manage_followers']??false,
        setRole: json['set_role']??false,
        remove: json['remove']??false,
        activate: json['remove']??false,
        complete: json['complete']??false,
        cancel: json['complete']??false,
        manageCards: json['manage_cards']??false,
        changeRole: json['change_role']??false);
  }
}
